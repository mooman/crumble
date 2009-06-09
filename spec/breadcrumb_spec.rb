require File.dirname(__FILE__) + '/spec_helper'

describe Breadcrumb do
  describe "when configuring the instance" do
    it "should add trails" do
      Breadcrumb.configure do
        trail :accounts, :edit, [:profile, :your_account]
      end
      
      trail = Breadcrumb.instance.trails.last
      trail.controller.should == :accounts
      trail.action.should == :edit
      trail.trail.should == [:profile, :your_account]
    end
    
    it "should add crumbs" do
      Breadcrumb.configure do
        crumb :profile, "Public Profile", :user_url, :user
      end
      
      profile = Breadcrumb.instance.crumbs[:profile]
      profile.title.should == "Public Profile"
      profile.url.should == :user_url
      profile.params.should == [:user]
    end
    
    it "should store the delimiter" do
      Breadcrumb.configure do
        delimit_with "/"
      end
      
      Breadcrumb.instance.delimiter.should == "/"
    end
  end
end