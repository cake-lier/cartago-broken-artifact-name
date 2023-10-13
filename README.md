# CArtAgO broken artifact name

This repository is to showcase a bug in the CArtAgO platform in its 3.0 version.
In this new version, the "artifact_name" annotation can't be used on its own for "referencing" an artifact, but it needs also the "wsp" annotation.
Sadly, this works for operation invocation, but not for signal and observable property change perception.
