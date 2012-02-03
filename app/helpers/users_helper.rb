module UsersHelper
	
	def unsupported
		user_agent = UserAgent.parse(request.user_agent)
    return user_agent.browser == 'Firefox' && user_agent.version.to_s.to_f < 6.0
	end
	
end
