class BookmarksController < ApplicationController

  def index
    @bookmarks = policy_scope(Bookmark)
  end

  def create
  end

  def delete
  end
end
