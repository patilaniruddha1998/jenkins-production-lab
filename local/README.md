# Local Jenkins (Docker Compose)

```
./scripts/up.sh      # first run creates compose/.env; edit password, rerun
```
- Controller has 0 executors; work runs on agents (added next).
- State lives in the named volume `jenkins_home`.
- Config is code: `jcasc/jenkins.yaml`; plugins pinned in `compose/plugins.txt`.
