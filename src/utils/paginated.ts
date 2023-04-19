import { PrismaService } from '@libs/prisma';
import { PaginationInput } from '../common/models/pagination';

export const toCursor = (data: number): string =>
  Buffer.from(data.toString()).toString('base64');
export const fromCursor = (cursorKey: any, value?: string) =>
  !value
    ? undefined
    : { [cursorKey]: Number(Buffer.from(value, 'base64').toString('ascii')) };
export const fromMeiliCursor = (value?: string) =>
  !value ? undefined : Number(Buffer.from(value, 'base64').toString('ascii'));

export const paginatedResponse = async <
  Model extends { count: any; findMany: any },
>(
  prisma: PrismaService,
  model: Model,
  args: Parameters<Model['findMany']>[0] = {},
  // eslint-disable-next-line @typescript-eslint/ban-ts-comment
  // @ts-ignore
  cursorKey: keyof Parameters<Model['findMany']>[0]['cursor'],
  paginationParams: PaginationInput,
) => {
  const { cursor } = paginationParams;
  const take = paginationParams.take ?? 10;

  const [totalCount, data] = await prisma.$transaction([
    model.count({ where: (args as any).where ?? {} }),
    model.findMany({
      cursor: fromCursor(cursorKey, cursor),
      ...(take === -1 ? {} : { take: take + 1 }),
      ...(args ?? {}),
    }),
  ]);

  const hasMore = data.length === take + 1;
  let nextCursor: string;

  if (take !== -1 && hasMore) {
    nextCursor = toCursor(data[take][cursorKey]);
    data.pop();
  }

  return {
    data: data as any[],
    cursor: nextCursor,
    totalCount,
    hasMore,
  };
};
