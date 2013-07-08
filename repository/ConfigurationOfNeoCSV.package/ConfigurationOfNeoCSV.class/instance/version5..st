versions
version5: spec
	<version: '5' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.10';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.9' ]