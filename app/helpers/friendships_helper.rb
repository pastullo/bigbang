module FriendshipsHelper
	def down_to_bang_cta user
		friendship = current_user.friendships.where(:friend_id => user.id).where(:user_id => current_user.id)
		# return friendship.inspect
		if friendship.empty? 
		    link_to "<span class=\"glyphicon glyphicon-heart\"></span> Down to Bang".html_safe, friendships_path(:friend_id => user.id), :method => :post, class: 'btn btn-sm btn-primary'
		else
			link_to "<span class=\"glyphicon glyphicon-remove\"></span> Unbang".html_safe, friendship.first, :method => :delete, class: 'btn btn-sm btn-link'
	    end		
	end
end
