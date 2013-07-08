require 'spec_helper'

describe "Home Page" do
  describe "GET /" do

    context "empty database" do
      before(:each) do
        visit '/'
      end

      it "renders success" do
        expect(page.status_code).to be(200)
      end

      describe "masthead" do

        it "displays title" do
          expect(page).to have_selector 'h1', text:'Comments Dashboard'
        end

        it "displays subtitle" do
          expect(page).to have_selector 'h2', text:'Read comments from your blog.'
        end

        it "displays page title" do
          expect(page).to have_title 'Comments Dashboard'
        end
      end
    end

    context "non-empty database" do
      before(:each) do
        visit '/'
      end

      it "show a list of blogs" do
        expect(page).to have_selector 'li a', text:'Mashable'
      end

    end
  end

end
