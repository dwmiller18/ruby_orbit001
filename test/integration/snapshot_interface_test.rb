require 'test_helper'

class SnapshotInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jane)
  end

  test "snapshot interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Snapshot.count' do
      post snapshots_path, params: { snapshot: { content: "" } }
    end
    assert_select 'div#error_explanation'
    assert_select 'a[href=?]', '/?page=2' # Correct pagination link
    # Valid submission
    content = "Great Demo Today!"
    assert_difference 'Snapshot.count', 1 do
      post snapshots_path, params: { snapshot: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_snapshot = @user.snapshots.paginate(page: 1).first
    assert_difference 'Snapshot.count', -1 do
      delete snapshots_path(first_snapshot)
    end
    # Visit different user ( no delete links )
    get user_path(users(:dustin))
    assert_select 'a', text: 'delete', count: 0
  end
end
