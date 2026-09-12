using GalacticSpacefarerService as service from './spacefarer-service';

annotate service.Spacefarers with @(
  UI.HeaderInfo: {
    TypeName      : 'Spacefarer',
    TypeNamePlural: 'Spacefarers',
    Title         : { Value: name }
  },

  UI.SelectionFields: [
    department_ID,
    originPlanet,
    status,
    spacesuitColor
  ],

  UI.LineItem: [
    { Value: name },
    { Value: department.name, Label: 'Department' },
    { Value: originPlanet },
    { Value: stardustCollection },
    { Value: wormholeNavigationSkill },
    { Value: spacesuitColor },
    { Value: status }
  ]
);
