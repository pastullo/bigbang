module FriendshipsHelper
	def down_to_bang_cta user
		friendship = current_user.friendships.where(:friend_id => user.id).where(:user_id => current_user.id)
		# return friendship.inspect
		if friendship.empty? 
		    link_to "Add Friend", friendships_path(:friend_id => user.id), :method => :post
		else
			link_to "Remove Friend", friendship.first, :method => :delete
	    end		
	end
end
