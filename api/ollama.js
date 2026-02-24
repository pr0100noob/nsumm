export default async function handler(req, res) {
  const { url, ...body } = req.body;
  
  const ollamaUrl = process.env.OLLAMA_URL || 'http://91.219.166.119:11434';
  
  const path = req.url.replace('/api/ollama', '');
  
  try {
    const response = await fetch(`${ollamaUrl}${path}`, {
      method: req.method,
      headers: { 'Content-Type': 'application/json' },
      body: req.method !== 'GET' ? JSON.stringify(req.body) : undefined,
    });
    
    const data = await response.json();
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({ error: 'Ollama unreachable' });
  }
}
