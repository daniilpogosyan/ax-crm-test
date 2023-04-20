import { PrismaService } from 'src//modules/prisma/prisma.service';
import { Inject, Injectable } from '@nestjs/common';

@Injectable()
export class GeneralService {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}

  fetchCountries() {
    return this.prisma.country.findMany();
  }

  fetchCities(countryId: number) {
    return this.prisma.city.findMany({
      where: { countryId },
    });
  }

  fetchLanguages() {
    return this.prisma.language.findMany();
  }

  fetchNationality() {
    return this.prisma.nationality.findMany();
  }
}
