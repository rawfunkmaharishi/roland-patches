lines = File.readlines 'songs.csv'

def tablify line
  fields = line.split(',').map! { |f| f.strip }
  until fields.length == 5
    fields.push ''
  end

  '| %s |' % fields.join(' | ')
end

out = [tablify(lines.shift)]
out.push '|-|-|-|-|-|'

lines.sort.each do |line|
  out.push tablify(line)
end

File.open 'SONGS.md', 'w' do |f|
  out.each do |line|
    f.write line
    f.write "\n"
  end
end
