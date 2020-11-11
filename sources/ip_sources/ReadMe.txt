Author: Sandip Das

Please Read the following carefully if you are changing the following IPs:

1. ControlledBurstGen
2. ControlledBurstCheck
3. SOP Detect
These IPs are generated from vivado hls and then put onto the IP repository. Direct upgrade of these IP from vivado project manager throws errors in simulation as it somehow defaults to use the previous cached versions of the syntesized ip. seems like a vivado bug in the 2017.3 version. Probably it will be removed in the newer version of the vivado.

For a wayaround, Therefore, before updating these IPs in the vivado repository, remove the IP first from the vivao project manager sources, then replace IP files in the IP repository, followed by refreshing the IP repo and then add the IP again in the vivado project manager. 