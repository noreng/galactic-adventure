using { sap.galactic.spacefarers as db } from '../db/schema';

@requires: 'authenticated-user'
service GalacticSpacefarerService @(path: '/odata/v4/galactic') {

  @restrict: [
    { grant: 'READ',                              to: 'GalacticViewer', where: 'department.planet = $user.planet' },
    { grant: ['READ','CREATE','UPDATE','DELETE'], to: 'GalacticAdmin',  where: 'department.planet = $user.planet' }
  ]
  @odata.draft.enabled
  entity Spacefarers as projection on db.Spacefarers;

  @readonly
  entity Departments as projection on db.Departments;

  @readonly
  entity Positions   as projection on db.Positions;
}
