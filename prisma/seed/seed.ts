import { PrismaClient, TagType } from '@prisma/client';

import * as languagesJSON from './data/languages.json';
import * as countriesJSON from './data/countries.json';
import * as nationalitiesJSON from './data/nationality.json';

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
}

main();
