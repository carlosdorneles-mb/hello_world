Generate a new release version
==============================

To generate a project release, simply access the `▶️ Release <https://github.com/carlosdorneles-mb/hello_world/actions/workflows/release.yml>`_
action, click on ``Run Workflow`` and select the desired release type.

Once the version is generated, a new PR will be opened with the changes related to the generated version.
After the PR merge, the new tag will be generated and sent to Pypi for Dev and Prod.
