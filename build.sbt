name:= "MotelsLine"

organization:= "com.motelsline"

version:= "0.1.0"

enablePlugins(JettyPlugin)

libraryDependencies++=Seq(
   "javax.servlet" % "javax.servlet-api" % "3.1.0" % "provided",
   "org.json" % "json" % "20160810",
   "mysql" % "mysql-connector-java" % "5.1.39",
   "com.sendgrid" % "java-http-client" % "2.3.4",
   "com.sendgrid" % "sendgrid-java" % "3.0.9",
   "commons-fileupload" % "commons-fileupload" % "1.3.2",
   "org.apache.commons" % "commons-io" % "1.3.2"
)
