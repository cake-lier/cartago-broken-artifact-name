import cartago.Artifact;
import cartago.OPERATION;

public class ExampleArtifact extends Artifact {

    private void init() {
        defineObsProperty("property", 0);
    }

    @OPERATION
    public void updateObservableProperty() {
        updateObsProperty("property", getObsProperty("property").intValue() + 1);
        log("The observable property was updated");
    }

    @OPERATION
    public void triggerSignal() {
        signal("signal");
        log("The signal was triggered");
    }
}
