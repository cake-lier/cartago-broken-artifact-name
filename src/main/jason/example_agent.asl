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
    println("EXPECTED, CORRECT");
    println("Before updating an observable property with the artifact id annotation");
    updateObservableProperty [artifact_id(ArtId)];
    println("EXPECTED, CORRECT");
    println("Before updating an observable property with only the artifact name annotation");
    updateObservableProperty [artifact_name("artifact")];
    println("EXPECTED, INCORRECT");
    println("Before updating an observable property with the artifact name and workspace id annotation");
    updateObservableProperty [artifact_name("artifact"), wsp("main")];
    println("EXPECTED, CORRECT").

+!second_test : true <-
    triggerSignal.

+property(V) : true <-
    println("The observable property was updated (", V, ") without any annotation").

+property(V) [artifact_id(ArtId)] : artifact(ArtId) <-
    println("The observable property was updated (", V, ") with the artifact id annotation").

+property(V) [artifact_name("artifact")] : true <-
    println("The observable property was updated (", V, ") with only the artifact name annotation").

+property(V) [artifact_name("artifact"), wsp("main")] : true <-
    println("The observable property was updated (", V, ") with the artifact name and the workspace annotation").

+signal : true <-
    println("I'm a signal without any annotation").

+signal [artifact_id(ArtId)] : artifact(ArtId) <-
    println("I'm a signal with the artifact id annotation").

+signal [artifact_name("artifact")] : true <-
    println("I'm a signal with only the artifact name annotation").

+signal [artifact_name("artifact"), wsp("main")] : true <-
    println("I'm a signal with the artifact name and workspace annotation").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }