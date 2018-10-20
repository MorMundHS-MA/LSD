### Known Issues  
1. On first launch through intellij an error will appear because the working directory was not created yet. Relaunching once the ant build has finished will work as expected.
2. Dependecies are not automatically downloaded. Before launching the first time the ant task download has to be executed manually.
3. The specific "Tomcat Native Connector - 1.2" used is missing on some mirrors so downloads might sometimes fail.
