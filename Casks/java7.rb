class Java7 < Cask
#  url 'http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-macosx-x64.dmg',
#      :cookies => {
#                    'oraclelicense' => 'accept-securebackup-cookie'
#                  }

  url 'http://dev-download.oceanwing.com/java7-1.7.0_60.dmg'
  homepage 'http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html'
  version '1.7.0_60'
  sha256 'a868aab818cd114f652252ded5b159b5c47beb1a0a074cdb0e475ed79826c9df'
  install 'JDK 7 Update 60.pkg'
  after_install do
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string BundledApp', "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string JNI',        "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string WebStart',   "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string Applets',    "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/bin/rm', '-rf', '--', '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK'
    system '/usr/bin/sudo', '-E', '--',
      '/bin/ln', '-nsf', '--', "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents", '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK'
  end
  uninstall :pkgutil => 'com.oracle.jdk7u60',
            :files => '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK'
  caveats <<-EOS.undent
    This Cask makes minor modifications to the JRE to prevent any packaged
    application issues.

    If your Java application still asks for JRE installation, you might need to
    reboot or logout/login.

    The JRE packaging bug is discussed here:

        https://bugs.eclipse.org/bugs/show_bug.cgi?id=411361

    Installing this Cask means you have AGREED to the Oracle Binary Code License
    Agreement for Java SE at

        http://www.oracle.com/technetwork/java/javase/terms/license/index.html

    EOS
end
