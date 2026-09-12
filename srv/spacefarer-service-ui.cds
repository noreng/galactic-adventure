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
  ],

  UI.Facets: [
    { $Type: 'UI.ReferenceFacet', Label: 'General', Target: '@UI.FieldGroup#General' },
    { $Type: 'UI.ReferenceFacet', Label: 'Progress', Target: '@UI.FieldGroup#Progress' }
  ],

  UI.FieldGroup #General: { Data: [
    { Value: name },
    { Value: email },
    { Value: originPlanet },
    { Value: department_ID },
    { Value: position_ID },
    { Value: joinedAt }
  ] },

  UI.FieldGroup #Progress: { Data: [
    { Value: stardustCollection },
    { Value: wormholeNavigationSkill },
    { Value: spacesuitColor },
    { Value: status }
  ] }
);
