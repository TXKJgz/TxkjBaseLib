Pod::Spec.new do |s|
  s.name             = 'TxkjBaseLib'
  s.version          = '0.0.1'
  s.summary          = 'TxkjBaseLib 基础库，封装了常用的功能'
  
  s.description      = <<-DESC
    TxkjBaseLib 是一个基础功能封装库，包含了一些常用的 Swift 工具方法，
    比如类似 Then 的链式调用等。
  DESC

  s.homepage         = 'https://github.com/TXKJgz/TxkjBaseLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'helinyu' => 'helinyu3@qq.com' }
  s.platform         = :ios, '14.0'
  s.swift_version    = '5.0'
  
  s.source           = { 
    :git => 'https://github.com/TXKJgz/TxkjBaseLib.git', 
    :tag => s.version 
  }

  s.subspec 'Then' do |ss|
    ss.source_files = 'Source/Then/**/*'
  end
end
