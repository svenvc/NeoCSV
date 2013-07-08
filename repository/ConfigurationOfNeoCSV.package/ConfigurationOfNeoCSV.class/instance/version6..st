versions
version6: spec
	<version: '6' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.12';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.11' ]