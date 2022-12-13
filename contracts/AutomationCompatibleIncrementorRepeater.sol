// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Incrementor.sol";
import "@chainlink/contracts/src/v0.8/AutomationCompatible.sol";

contract AutomationCompatibleIncrementorRepeater is AutomationCompatibleInterface {
	Incrementor public _incrementor;
	uint256 public _value;

	constructor(Incrementor incrementor) {
		_incrementor = incrementor;

		_value = 0;
	}

	function checkUpkeep(
		bytes calldata /* checkData */
	) external view override returns (bool upkeepNeeded, bytes memory /* performData */) {
		uint256 incrementorValue = _incrementor._value();

		upkeepNeeded = incrementorValue != _value;
	}

	function performUpkeep(bytes calldata /* performData */) external override {
		uint256 incrementorValue = _incrementor._value();

		bool upkeepNeeded = incrementorValue != _value;

		require(upkeepNeeded, "AutomationCompatibleIncrementorRepeater: upkeep not needed");

		_value = incrementorValue;
	}
}
