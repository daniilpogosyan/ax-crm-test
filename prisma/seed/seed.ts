import { PrismaClient, TagType } from '@prisma/client';

import * as languagesJSON from './data/languages.json';
import * as countriesJSON from './data/countries.json';
import * as nationalitiesJSON from './data/nationality.json';
import * as CoreEnums from '../../src/common/core';

async function main() {
  const prisma = new PrismaClient();

  const countriesResult = await prisma.$transaction(
    countriesJSON.map((country) => {
      return prisma.country.create({
        data: {
          emoji: country.emoji,
          phoneCode: country.phoneCode,
          shortCode1: country.shortCode1,
          shortCode2: country.shortCode2,
          title: country.title,
          cities: {
            createMany: {
              data: country.cities.map((city) => {
                return {
                  offset: city.offset,
                  offsetMs: city.offsetMs,
                  timezone: city.timezone,
                  title: city.title,
                };
              }),
            },
          },
        },
      });
    }),
  );

  const nationalitiesResult = await prisma.$transaction(
    nationalitiesJSON.map(({ title, countryCode }) => {
      return prisma.nationality.create({
        data: {
          title,
          ...(countryCode
            ? { country: { connect: { shortCode1: countryCode } } }
            : {}),
        },
      });
    }),
  );

  const languagesResult = await prisma.$transaction(
    languagesJSON.map(({ title, native, shortCode, countryCodes }) => {
      return prisma.language.create({
        data: {
          title,
          native,
          shortCode,
          ...(countryCodes
            ? {
                countries: {
                  connect: countriesJSON
                    .filter((c) => countryCodes.includes(c.shortCode1))
                    .map((c) => ({ shortCode1: c.shortCode1 })),
                },
              }
            : {}),
        },
      });
    }),
  );

  const [countries, cities, nationalities, languages] =
    await prisma.$transaction([
      prisma.country.findMany({ select: { id: true } }),
      prisma.city.findMany({ select: { id: true } }),
      prisma.nationality.findMany({ select: { id: true } }),
      prisma.language.findMany({ select: { id: true } }),
    ]);

  const result = await prisma.$transaction([
    prisma.tagCategory.create({
      include: { tags: { include: { country: true } } },
      data: {
        title: 'Country',
        tags: {
          create: countries.map(({ id }) => ({
            type: TagType.COUNTRY,
            country: { connect: { id } },
          })),
        },
      },
    }),
    prisma.tagCategory.create({
      include: { tags: { include: { city: true } } },
      data: {
        title: 'City',
        tags: {
          create: cities.map(({ id }) => ({
            type: TagType.CITY,
            city: { connect: { id } },
          })),
        },
      },
    }),
    prisma.tagCategory.create({
      include: { tags: { include: { nationality: true } } },
      data: {
        title: 'Nationality',
        tags: {
          create: nationalities.map(({ id }) => ({
            type: TagType.NATIONALITY,
            nationality: { connect: { id } },
          })),
        },
      },
    }),
    prisma.tagCategory.create({
      include: { tags: { include: { language: true } } },
      data: {
        title: 'Language',
        tags: {
          create: languages.map(({ id }) => ({
            type: TagType.LANGUAGE,
            language: { connect: { id } },
          })),
        },
      },
    }),
  ]);

  const seedData = new Map();
  seedData.set(CoreEnums.LeadStatusIndex, {
    data: {
      [CoreEnums.LeadStatusIndex.new]: {
        title: 'New',
        color: '#175CD3',
        backgroundColor: '#EFF8FF',
        step: 1,
      },
      [CoreEnums.LeadStatusIndex.noAnswer]: {
        title: 'No answer',
        color: '#C01048',
        backgroundColor: '#FFF1F3',
        step: 2,
      },
      [CoreEnums.LeadStatusIndex.contacted]: {
        title: 'Contacted',
        color: '#C4320A',
        backgroundColor: '#FFF6ED',
        step: 3,
      },
      [CoreEnums.LeadStatusIndex.optionsSent]: {
        title: 'Options sent',
        color: '#3538CD',
        backgroundColor: '#EEF4FF',
        step: 4,
      },
      [CoreEnums.LeadStatusIndex.warm]: {
        title: 'Warm',
        color: '#026AA2',
        backgroundColor: '#F0F9FF',
        step: 5,
      },
      [CoreEnums.LeadStatusIndex.hot]: {
        title: 'Hot',
        color: '#5925DC',
        backgroundColor: '#F4F3FF',
        step: 6,
      },
      [CoreEnums.LeadStatusIndex.customer]: {
        title: 'Customer',
        color: '#027A48',
        backgroundColor: '#ECFDF3',
        step: 7,
      },
      [CoreEnums.LeadStatusIndex.archive]: {
        title: 'Archive',
        color: '#363F72',
        backgroundColor: '#F8F9FC',
        step: 8,
      },
      [CoreEnums.LeadStatusIndex.junk]: {
        title: 'Junk',
        color: '#B42318',
        backgroundColor: '#FEF3F2',
        step: 9,
      },
      [CoreEnums.LeadStatusIndex.unsuccessful]: {
        title: 'Unsuccessful',
        color: '#344054',
        backgroundColor: '#F2F4F7',
        step: 10,
      },
    },
    method: prisma.leadStatus.create,
  });

  seedData.set(CoreEnums.EventTypeIndex, {
    data: {
      [CoreEnums.EventTypeIndex.followUp]: 'Follow up',
      [CoreEnums.EventTypeIndex.meeting]: 'Meeting',
    },
    method: prisma.eventType.create,
  });

  seedData.set(CoreEnums.FollowUpTypeIndex, {
    data: {
      [CoreEnums.FollowUpTypeIndex.call]: { title: 'Call', color: '#5bc541' },
      [CoreEnums.FollowUpTypeIndex.message]: {
        title: 'Message',
        color: '#6183f7',
      },
      [CoreEnums.FollowUpTypeIndex.wait]: { title: 'Wait', color: '#f19e38' },
    },
    method: prisma.followUpType.create,
  });

  const requests = [];

  for (const [_enum, payload] of seedData) {
    for (const key in Object.keys(_enum)) {
      if (_enum.hasOwnProperty(key)) {
        requests.push(
          payload.method({
            data:
              typeof payload.data[key] === 'object'
                ? { id: parseInt(key), ...payload.data[key] }
                : { id: parseInt(key), title: payload.data[key] },
          }),
        );
      }
    }
  }

  await prisma.$transaction(requests);
}

main();
