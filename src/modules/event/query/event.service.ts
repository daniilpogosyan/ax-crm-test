import { PrismaService } from 'src/modules/prisma/prisma.service';
import { Inject, Injectable } from '@nestjs/common';

@Injectable()
export class EventQueryService {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}
}
