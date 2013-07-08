versions
version7: spec
	<version: '7' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.13';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.12' ]