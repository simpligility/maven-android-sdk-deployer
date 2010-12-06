Maven Android SDK Deployer
--------------------------

Author: Manfred Moser manfred@simpligility.com  at [simpligility technologies inc](http://www.simpligility.com)


ATTENTION!
Currently android.jar artifacts are available in Maven central and unless you use maps related dependencies or insist on
using the original jar files from the local SDK install, you will not need this tool anymore.

You will however need this tool to access the latest Android 2.3 release or to work around bugs like missing JSON libraries
in some older artifacts deployed to Maven central. If you  use this tool make sure your dependencies are as documented here.

The Maven Android SDK Deployer is a helper maven project that can be used to install the libraries
necessary to build Android applications with Maven and the Maven Android Plugin directly from your local Android SDK
installation.

The android.jar artifacts in Maven central are available with the groupId com.google.android, whereas this tool uses
android.android to avoid overlap.

How to Use
----------

- download the latest Android SDK from http://developer.android.com/sdk/index.html following the instructions there,
for the default usage of the deployer install all platforms and add-on apis, ensure that all folder in the platforms
folder have names like android-3, android-4 and so on. If you find names using the platform version (e.g. 15) in the folder
 name reinstall that platform from the android tool. In a similar manner the folder names in add-ons have to use the pattern
 addon_google_apis_google_inc_3 up to addon_google_apis_google_inc_8. If the folder names are different reinstall the add-ons
 as well

- set up the environment variable ANDROID_HOME to contain the absolute folder you just installed the SDK to
 (e.g. under bash: export ANDROID_HOME=/opt/android_sdk_linux)
 
 - ensure that the folder for ANDROID _HOME and all files within are readable by the current user

- run the command

    mvn install

 in the root folder of this project (same as README you are just reading) to install all
 platforms and add-on apis

- to install only a certain sdk level use

    mvn install -P 1.5

    mvn install -P 1.6

    mvn install -P 2.1

    mvn install -P 2.2

    mvn install -P 2.3

- as a result you should find the android.jar and maps.jar in various versions in your users local repository
  (~/.m2/repository/android and ~/.m2/repository/com/google/android/maps) and you can therefore use the following
  dependencies in your project

  for the core platforms

          <dependency>
              <groupId>android</groupId>
              <artifactId>android</artifactId>
              <version>1.5_r4</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>android</groupId>
              <artifactId>android</artifactId>
              <version>1.6_r3</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>android</groupId>
              <artifactId>android</artifactId>
              <version>2.1_r2</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>android</groupId>
              <artifactId>android</artifactId>
              <version>2.2_r1</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>android</groupId>
              <artifactId>android</artifactId>
              <version>2.3_r1</version>
              <scope>provided</scope>
          </dependency>

  for the maps add ons

          <dependency>
              <groupId>com.google.android.maps</groupId>
              <artifactId>maps</artifactId>
              <version>3_r3</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>com.google.android.maps</groupId>
              <artifactId>maps</artifactId>
              <version>4_r2</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>com.google.android.maps</groupId>
              <artifactId>maps</artifactId>
              <version>7_r1</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>com.google.android.maps</groupId>
              <artifactId>maps</artifactId>
              <version>8_r1</version>
              <scope>provided</scope>
          </dependency>

          <dependency>
              <groupId>com.google.android.maps</groupId>
              <artifactId>maps</artifactId>
              <version>9_r1</version>
              <scope>provided</scope>
          </dependency>

How To Use for Deploying Onto Remote Server
-------------------------------------------

The above deployment works fine for one machine, but what if you need to supply a whole team of developers and a cluster
of build machines with the artifacts. Well, you follow these steps:

- as a condition you need to have a repository server used by all those machines and the following process will deploy to
this server, which will in turn provide the artifacts to all the machines.

- edit the repo.url property in the pom.xml to point to the repository you want to publish to and then add a server with
the credentials to your settings.xml.

E.g.
<settings>
    <servers>
        <server>
            <id>android.repo</id>
            <username>your username</username>
            <password>your password</password>
        </server>
    </servers>
</settings>

- run the command

    mvn deploy

 in the root folder of this project (same as README you are just reading), you can also
 use the same profile options for the different api levels 

- as a result you should find the artifact in the repository of your remote server

For more information about this stuff look at the documentation for the maven-deploy-plugin.

Mailinglist - Questions
-----------------------

Please direct any questions to the community at the  Maven Android Developers mailing list at
http://groups.google.com/group/maven-android-developers
 
Known problems
-------------

- Platforms and Add on folder names changes in SDK

When updating an existing android sdk install the add-ons subfolder can sometimes be reused
and their contents be updates so you could end up with e.g. the google maps-4r2 in a folder
named google_apis-4_r01. To work around this just uninstall the affected add-on and reinstall
it with the android sdk tool.

Similarly the platform specific folder used to be e.g. android-1.5 and is now android-3 using the api level as the numeric
identifier. If your SDK install uses the old folder names for any platform simply reinstall that platform with the android
tool.

Issues
------

If you find any problems or would like to suggest a feature,  please feel free to file an issue on github at
http://github.com/mosabua/maven-android-sdk-deployer/issues

Potential todo items
--------------------

- add custom pom files for install/deploy that eg. define dependency from maps to android jar

- maybe some sort of reporting of errors, failures and success as well

Additional Contributors
-----------------------

Hugo Josefson <hugo@josefson.org> - properties plugin usage
