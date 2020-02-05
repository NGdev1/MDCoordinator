Pod::Spec.new do |s|

  s.name = "MDCoordinator"
  s.version = "1.0.1"
  s.summary = "Координатор для IOS приложения."

  s.platform = :ios, "10.0"

  s.swift_version = '5'

  s.description  = <<-DESC
                  Библиотека для приложений
  DESC

  s.license = { :type => 'Custom', :text => <<-LICENSE
                  Copyright 2020
                  Permission is granted to MD
                  LICENSE
               }

  s.author = { "Andreichev Michael" => "andreichev.m@mail.ru" }
  s.homepage     = "https://github.com/NGdev1/MDCoordinator"
  s.source = { :git => "https://github.com/NGdev1/MDCoordinator", :tag => "#{s.version}" }

  s.subspec 'Source' do |ss|
    ss.source_files = ["Source/**/*.swift"]
  end

end
