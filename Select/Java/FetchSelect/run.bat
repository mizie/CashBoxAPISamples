
REM Add all required Axis jars to the ClassPath;
cd ..\..
SET DIR=%CD%
echo "Executing in: %DIR% ..."
SET AXISDIR=%DIR%\Axis2\axis2-1.6.2\lib
SET CP1=%AXISDIR%\commons-cli-1.2.jar;%DIR%\Axis2\bin;%AXISDIR%\axis2-adb-1.6.2.jar
SET CP2=%CP1%;%AXISDIR%\axiom-api-1.2.13.jar;%AXISDIR%\axis2-kernel-1.6.2.jar
SET CP3=%CP2%;%AXISDIR%\wsdl4j-1.6.2.jar;%AXISDIR%\*.jar
SET CP4=%CP3%;%AXISDIR%\XmlSchema-1.4.7.jar;%AXISDIR%\axiom-impl-1.2.13.jar
SET CP5=%CP4%;%AXISDIR%\neethi-3.0.2.jar;%AXISDIR%\mail-1.4.jar
SET CP6=%CP5%;%AXISDIR%\axis2-transport-http-1.6.2.jar;%AXISDIR%\axis2-transport-local-1.6.2.jar
SET CP7=%CP6%;%AXISDIR%\commons-httpclient-3.1.jar;%AXISDIR%\httpcore-4.0.jar
SET CP8=%CP7%;%AXISDIR%\commons-codec-1.3.jar;%AXISDIR%\httpcore-4.0.jar;%DIR%\junit-4.11.jar

REM SET VERSION=v1_0
SET VERSION=v1_1
SET SELECT=Select_%VERSION%
SET BASEDIR=%DIR%\Select
REM Now add the Select WSDL generated class files + the local java test class files:
SET CP=%CP8%;%BASEDIR%\bin;%BASEDIR%\bin\Vindicia%SELECT%.jar
REM SET CP=%CP8%;%SELECT%\bin;%BASEDIR%\bin
REM SET CP=%CP8%;%SELECT%\build\classes;%BASEDIR%\bin


REM  In %BASEDIR\Select\src\com\vindicia\soap\v1_1\selecttypes\ReturnCode.java;
REM 
REM  Note; To compile ReturnCode.java, I had to comment out the following line 566;
REM 	if ((enumeration == null) && !((value == null) || (value.equals("")))) {
REM  and replace it with this;
REM 	if ((enumeration == null)) {


REM  Compile the Select WSDL generated java class files & place into Select\bin directory;
REM cd %BASEDIR%\%SELECT%
REM javac -cp .;%CP% -d bin src\com\vindicia\soap\v1_1\selecttypes\*.java src\com\vindicia\soap\v1_1\select\*.java

REM  Compile the Select Test files to drive the generated java class files & place into bin directory;
cd %BASEDIR%

java -version
java -cp bin;%CP% SEL002FetchSelect -fetch 1 -fetchStart 31 -fetchStartMin 0 -fetchEndMin 0

pause
