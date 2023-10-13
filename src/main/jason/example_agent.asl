!test.

+!test : true <-
    !first_test;
    !second_test.

+!first_test : true <-
    makeArtifact("artifact", "ExampleArtifact", [], ArtId);
    +artifact(ArtId);
    focus(ArtId);
    println("Before updating an observable property without annotations");
    updateObservableProperty;
    println("It works and it is expected");
    println("Before updating an observable property with the artifact id annotation");
    updateObservableProperty [artifact_id(ArtId)];
    println("It works and it is expected");
    println("Before updating an observable property with only the artifact name annotation");
    updateObservableProperty [artifact_name("artifact")];
    println("It works and it is not expected, an error is thrown but the operation executes anyway");
    println("Before updating an observable property with the artifact name and workspace id annotation");
    updateObservableProperty [artifact_name("artifact"), wsp("main")];
    println("It works and it is expected").

+!second_test : true <-
    triggerSignal.
/*
+property(V) : true <-
    println("The observable property was updated (", V, ") without any annotation"). // It works and it is expected
*/
+property(V) [artifact_id(ArtId)] : artifact(ArtId) <-
    println("The observable property was updated (", V, ") with the artifact id annotation"). // It works and it is expected
/*
+property(V) [artifact_name("artifact")] : true <-
    println("The observable property was updated (", V, ") with only the artifact name annotation"). // It does not work and it is expected, no error notified

+property(V) [artifact_name("artifact"), wsp("main")] : true <-
    println("The observable property was updated (", V, ") with the artifact name and the workspace annotation").   // It does not work and it is not expected
*/
/*
+signal : true <-
    println("I'm a signal without any annotation"). // It works and it is expected

+signal [artifact_id(ArtId)] : artifact(ArtId) <-
    println("I'm a signal with the artifact id annotation"). // It works and it is expected

+signal [artifact_name("artifact")] : true <-
    println("I'm a signal with only the artifact name annotation"). // It does not work and it is expected, no error notified
*/
+signal [artifact_name("artifact"), wsp("main")] : true <-
    println("I'm a signal with the artifact name and workspace annotation"). // It does not work and it is not expected, no error notified

{ include("$jacamoJar/templates/common-cartago.asl") }
