module FriendshipsHelper
	def down_to_bang_cta user
		friendship = current_user.friendships.where(:friend_id => user.id).where(:user_id => current_user.id)
		# return friendship.inspect
		if friendship.empty? 
		    link_to "Down to Bang", friendships_path(:friend_id => user.id), :method => :post
		else
			link_to "Unbang", friendship.first, :method => :delete
	    end		
	end
end
