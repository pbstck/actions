import {  getEnvironnement } from "./getEnvironnement.js";

import core from "@actions/core";
import GitHub from "@actions/github";

try {
    let environnement = getEnvironnement(GitHub.context.ref);
    core.setOutput('target_env', environnement);
} catch (e) {
    core.setFailed(e.message)
}
