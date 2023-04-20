import { PrismaService } from 'src/modules/prisma/prisma.service';
import { Body, Controller, Inject, Post } from '@nestjs/common';
import { CreateCandidate } from 'src/modules/general/general.dto';

@Controller()
export class GeneralController {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}

  @Post('create-candidate')
  createCandidate(@Body() body: CreateCandidate) {
    // Yes, I AM going to store their passwords in db as is
    return this.prisma.candidate.create({
      data: {
        name: body.name,
        password: body.password,
      },
    });
  }
}
