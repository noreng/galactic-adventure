const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
  const { Spacefarers } = this.entities;

  this.before('CREATE', Spacefarers, (req) => {
    const data = req.data;

    if (data.stardustCollection == null || data.stardustCollection < 0) {
      data.stardustCollection = 0;
    }

    if (data.wormholeNavigationSkill == null) {
      data.wormholeNavigationSkill = 10;
    } else if (data.wormholeNavigationSkill < 0 || data.wormholeNavigationSkill > 100) {
      return req.reject(400, `wormholeNavigationSkill must be between 0 and 100, got ${data.wormholeNavigationSkill}`);
    }

    if (!data.spacesuitColor) {
      data.spacesuitColor = 'Silver';
    }
    if (!data.status) {
      data.status = 'recruit';
    }
    if (!data.joinedAt) {
      data.joinedAt = new Date().toISOString().slice(0, 10);
    }
  });

  this.after('CREATE', Spacefarers, async (_result, req) => {
    cds.log('spacefarers').info(`Welcome aboard, ${req.data.name}!`);
  });
});
