## Installing a different version of Java

Download from [here](http://jdk.java.net/archive/).
```bash
cd ~/Downloads
tar xf openjdk-12.0.1_osx-x64_bin.tar.gz
```

Move the extracted folder to a place where macOS searches for Java JDK.
```bash
sudo mv jdk-12.0.1.jdk /Library/Java/JavaVirtualMachines/
```

Create aliases to switch between Java versions (in .zlogin, .bash_profile).
```bash
alias j8="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8); java -version"
alias j11="export JAVA_HOME=$(/usr/libexec/java_home -v 11); java -version"
```
