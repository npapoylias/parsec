accessing
functionBlock

	^ super functionBlock ==> [ :values | (values last arguments: values second args) <-> values ]