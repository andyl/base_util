"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const navigation_1 = require("./navigation");
const switch_to_view_1 = require("./switch-to-view");
const switch_to_model_1 = require("./switch-to-model");
const switch_to_test_1 = require("./switch-to-test");
const switch_to_controller_1 = require("./switch-to-controller");
const switch_to_fixture_1 = require("./switch-to-fixture");
const create_view_1 = require("./create-view");
const create_spec_1 = require("./create-spec");
exports.commands = {
    fastNavigation: navigation_1.navigateRails,
    switchToView: switch_to_view_1.switchToView,
    switchToModel: switch_to_model_1.switchToModel,
    switchToTest: switch_to_test_1.switchToTest,
    switchToSpec: switch_to_test_1.switchToTest,
    switchToController: switch_to_controller_1.switchToController,
    switchToFixture: switch_to_fixture_1.switchToFixture,
    createView: create_view_1.createView,
    createSpec: create_spec_1.createSpec,
};
//# sourceMappingURL=index.js.map