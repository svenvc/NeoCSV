versions
version2: spec
	<version: '2' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.8';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.6' ]