# Reth Earthly CI/CD 
*Fast* CI/CD for reth using [earthly](https://earthly.dev/). 

# Goals 
An alternative to github workflows being used by reth at the moment. This aims to be the fastest CI/CD for reth powered by Earthly parallization and caching. Github is great for getting started but once the project grows, it starts to cost a lot more compared to running you own bare metal or cloud infrastructure for CI/CD.

1. Cache: Build between steps will leverage buildcache to speed up the process. 
2. Parallelization: Build steps will be parallelized by Earthly
3. Cloud agnostic: Can be run on any cloud provider (Hetzner, AWS, GCP, Azure)

# Building 
WIP

# Limited
Earthly doesn't support Windows at the moment, you need to rely on Github to do Windows release.

## Hardware requirement
64Gb Ram or more is recommended. 

64 cores CPU or more will fly through all the workflows.