baselines
baseline1: spec
	<version: '1-baseline'>
	
	spec for: #common do: [
		spec 
			blessing: #baseline;
			repository: 'http://mc.stfx.eu/Neo';
			package: 'Neo-CSV-Core';
			package: 'Neo-CSV-Tests' with: [ spec requires: 'Neo-CSV-Core' ];
			group: 'default' with: #('Neo-CSV-Core' 'Neo-CSV-Tests');
			group: 'Core' with: #('Neo-CSV-Core');
			group: 'Tests' with: #('Neo-CSV-Tests') ]