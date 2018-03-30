baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Neo-CSV-Core';
			package: 'Neo-CSV-Magritte' with: [ spec requires: 'Neo-CSV-Core' ];
			package: 'Neo-CSV-Tests' with: [ spec requires: 'Neo-CSV-Core' ];
			group: 'default' with: #('Neo-CSV-Core' 'Neo-CSV-Tests');
			group: 'Core' with: #('Neo-CSV-Core');
			group: 'Tests' with: #('Neo-CSV-Tests') ]