versions
version1: spec
	<version: '1' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.6';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.6' ]