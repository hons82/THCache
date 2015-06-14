Pod::Spec.new do |s|
	s.name					= "THCache"
	s.version				= "0.9.1"
	s.summary				= "Helper classes to handle storing/retrieving of standard data structures"
	s.homepage				= "https://github.com/hons82/THCache"
	s.license				= { :type => 'MIT', :file => 'LICENSE.md' }
	s.author				= { "Hannes Tribus" => "hons82@gmail.com" }
	s.source				= { :git => "https://github.com/hons82/THCache.git", :tag => "v#{s.version}" }
	s.platform				= :ios, '6.1'
	s.requires_arc			= true
	s.source_files			= 'THCache/Code/*.{h,m}'
end