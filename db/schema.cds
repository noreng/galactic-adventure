namespace sap.galactic.spacefarers;

using { cuid, managed } from '@sap/cds/common';

entity Departments : cuid {
  name        : String(80);
  planet      : String(20);
  positions   : Association to many Positions on positions.department = $self;
  spacefarers : Association to many Spacefarers on spacefarers.department = $self;
}

entity Positions : cuid {
  title      : String(80);
  department : Association to Departments;
}

entity Spacefarers : cuid, managed {
  name                    : String(100);
  email                   : String(120);
  originPlanet            : String(40);
  department              : Association to Departments;
  position                : Association to Positions;
  stardustCollection      : Decimal(10,2);
  wormholeNavigationSkill : Integer;
  spacesuitColor          : String(20);
  status                  : String(20) default 'recruit';
  joinedAt                : Date;
}
