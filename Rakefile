desc 'Run tests'
task :test do
  system "xcodebuild \
    -project THCache.xcodeproj \
    -scheme THCache \
    -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' \
    test"
end

task :default => :test