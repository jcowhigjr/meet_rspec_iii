class Blog < ActiveRecord::Base
  validates :title, :comments_feed_url,  presence: true, uniqueness: true

  #TODO why on: :create syntax?
  #builds the permalink before saving
  before_validation :build_permalink, on: :create

  has_many :comments do
    #TODO refreshes only the comments associated to the blog
    def refresh
      #TODO remember proxy_association
      comments_feed_url = proxy_association.owner.comments_feed_url
      comment_data = Wordpress::Comments::Client.new(comments_feed_url).fetch
      create_from_wordpress_client_attributes comment_data
    end

    def create_from_wordpress_client_attributes comment_data
      comment_data.map do |a_comment|
        attributes = a_comment.dup
        attributes[:opined_at] = attributes.delete(:date)
        comment new(attributes)
        if comment.save!
          comment
        end
      end

    end
  end

  def build_permalink
    if self.title
      self.permalink = self.title.parameterize
      #TODO think about how this works
    end

  end

  #to_param adds permalink to the model as a param
  def to_param
    permalink
  end

end
