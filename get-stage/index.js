import { getEnvironnement } from "./getEnvironnement";

import {setOutput} from "@actions/core";
import {context} from "@actions/github";

try {
    let environnement = getEnvironnement(context.ref);
    core.setOutput('target_env', environnement);
} catch (e) {
    core.setFailed(e.message)
}
