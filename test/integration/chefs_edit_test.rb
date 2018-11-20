require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(name: "Nadia",
      email: "nadia@example.com",
      password: "password",
      password_confirmation: "password")
    end

    test "reject an invalid edit" do
      sign_in_as(@chef, "password")
      get edit_chef_path(@chef)
      assert_template 'chefs/edit'
      patch chef_path(@chef), params: { chef: { name: " ",
        email: "nadia@example.com" } }
        assert_template 'chefs/edit'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
      end

      test "accept valid edit" do
        sign_in_as(@chef, "password")
        get edit_chef_path(@chef)
        assert_template 'chefs/edit'
        patch chef_path(@chef), params: { chef: { name: "Nadia1",
          email: "nadia1@example.com" } }
          assert_redirected_to @chef
          assert_not flash.empty?
          @chef.reload
          assert_match "Nadia1", @chef.name
          assert_match "nadia1@example.com", @chef.email
        end
      end
