@echo off

call mvn help:evaluate -Dexpression=project.artifactId -q -DforceStdout > %Temp%\mvninstall_temp_agv.txt
set /p artifactId=<%Temp%\mvninstall_temp_agv.txt
call mvn help:evaluate -Dexpression=project.groupId    -q -DforceStdout > %Temp%\mvninstall_temp_agv.txt
set /p    groupId=<%Temp%\mvninstall_temp_agv.txt
call mvn help:evaluate -Dexpression=project.version    -q -DforceStdout > %Temp%\mvninstall_temp_agv.txt
set /p    version=<%Temp%\mvninstall_temp_agv.txt

@echo.
@echo        Temp: %Temp%
@echo  artifactId: %artifactId%
@echo     groupId: %groupId%
@echo     version: %version%
@echo.

@rem clean & package
call mvn clean package -Dmaven.test.skip=true -DfailIfNoTests=false

@rem install
call mvn install:install-file -Dfile=target/%artifactId%-%version%.jar         -DgroupId=%groupId% -DartifactId=%artifactId% -Dversion=%version% -Dpackaging=jar
call mvn install:install-file -Dfile=target/%artifactId%-%version%-sources.jar -DgroupId=%groupId% -DartifactId=%artifactId% -Dversion=%version% -Dpackaging=jar -Dclassifier=sources
call mvn install:install-file -Dfile=pom.xml                                   -DgroupId=%groupId% -DartifactId=%artifactId% -Dversion=%version% -Dpackaging=pom

pause
