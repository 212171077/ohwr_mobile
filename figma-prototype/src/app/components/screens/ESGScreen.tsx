import React from 'react';
import { Leaf, TreePine, Home, Globe } from 'lucide-react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from 'recharts';

const monthlyImpact = [
  { month: 'Jul', co2: 412 },
  { month: 'Aug', co2: 438 },
  { month: 'Sep', co2: 406 },
  { month: 'Oct', co2: 456 },
  { month: 'Nov', co2: 384 },
  { month: 'Dec', co2: 362 },
  { month: 'Jan', co2: 478 },
];

export function ESGScreen() {
  const totalCO2Avoided = 14280; // kg
  const treesEquivalent = Math.floor(totalCO2Avoided / 21.77);
  const homesEquivalent = (totalCO2Avoided / 7300).toFixed(1);

  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-emerald-600 via-green-600 to-emerald-700 text-white p-6 rounded-b-3xl">
        <h1 className="text-2xl mb-1">ESG & Sustainability</h1>
        <p className="text-emerald-100 text-sm">Your environmental impact</p>
      </div>

      <div className="px-4 flex flex-col gap-4">
        {/* Total Carbon Avoided */}
        <div className="bg-gradient-to-br from-emerald-50 to-white rounded-2xl border border-emerald-200 p-6">
          <div className="flex items-center gap-2 mb-4">
            <Leaf className="w-6 h-6 text-emerald-600" />
            <h3 className="text-slate-900">Total Carbon Emissions Avoided</h3>
          </div>
          <div className="flex items-baseline gap-2 mb-1">
            <span className="text-5xl text-slate-900">{(totalCO2Avoided / 1000).toFixed(2)}</span>
            <span className="text-2xl text-slate-600">tons</span>
          </div>
          <p className="text-sm text-slate-600">CO₂ emissions since installation</p>
        </div>

        {/* Impact Equivalents */}
        <div className="grid grid-cols-2 gap-4">
          <div className="bg-white rounded-2xl border border-slate-200 p-4">
            <div className="flex items-center gap-2 mb-3">
              <div className="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center">
                <TreePine className="w-5 h-5 text-green-600" />
              </div>
            </div>
            <div className="text-3xl text-slate-900 mb-1">{treesEquivalent}</div>
            <div className="text-sm text-slate-600">Trees planted equivalent</div>
          </div>

          <div className="bg-white rounded-2xl border border-slate-200 p-4">
            <div className="flex items-center gap-2 mb-3">
              <div className="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center">
                <Home className="w-5 h-5 text-blue-600" />
              </div>
            </div>
            <div className="text-3xl text-slate-900 mb-1">{homesEquivalent}</div>
            <div className="text-sm text-slate-600">Homes powered (annual)</div>
          </div>
        </div>

        {/* Monthly Impact Chart */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <h3 className="text-slate-900 mb-1">Monthly CO₂ Avoided</h3>
          <p className="text-sm text-slate-500 mb-4">Last 7 months</p>
          <ResponsiveContainer width="100%" height={200}>
            <BarChart data={monthlyImpact}>
              <CartesianGrid strokeDasharray="3 3" stroke="#E2E8F0" />
              <XAxis 
                dataKey="month" 
                tick={{ fontSize: 12, fill: '#64748B' }}
                tickLine={false}
                axisLine={{ stroke: '#E2E8F0' }}
              />
              <YAxis 
                tick={{ fontSize: 12, fill: '#64748B' }}
                tickLine={false}
                axisLine={{ stroke: '#E2E8F0' }}
                label={{ value: 'kg CO₂', angle: -90, position: 'insideLeft', style: { fontSize: 12, fill: '#64748B' } }}
              />
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: '#1E293B', 
                  border: 'none', 
                  borderRadius: '8px',
                  color: '#fff'
                }}
                formatter={(value: number) => [`${value} kg`, 'CO₂ Avoided']}
              />
              <Bar 
                dataKey="co2" 
                fill="#10B981" 
                radius={[8, 8, 0, 0]}
              />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Monthly ESG Snapshot */}
        <div className="bg-gradient-to-br from-blue-50 to-white rounded-2xl border border-blue-200 p-4">
          <div className="flex items-center gap-2 mb-4">
            <Globe className="w-5 h-5 text-blue-600" />
            <h3 className="text-slate-900">This Month's Impact</h3>
          </div>
          <div className="space-y-3">
            <div className="flex justify-between items-center">
              <span className="text-sm text-slate-600">CO₂ Emissions Avoided</span>
              <span className="text-slate-900">478 kg</span>
            </div>
            <div className="flex justify-between items-center">
              <span className="text-sm text-slate-600">Clean Energy Generated</span>
              <span className="text-slate-900">876 kWh</span>
            </div>
            <div className="flex justify-between items-center">
              <span className="text-sm text-slate-600">Grid Reliance Reduction</span>
              <span className="text-emerald-600">84%</span>
            </div>
            <div className="flex justify-between items-center">
              <span className="text-sm text-slate-600">Renewable Energy %</span>
              <span className="text-emerald-600">92%</span>
            </div>
          </div>
        </div>

        {/* Environmental Metrics */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <h3 className="text-slate-900 mb-4">Environmental Metrics</h3>
          <div className="space-y-4">
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-slate-600">Coal Avoided</span>
                <span className="text-slate-900">6,426 kg</span>
              </div>
              <div className="w-full bg-slate-100 rounded-full h-2">
                <div className="bg-emerald-500 h-2 rounded-full" style={{ width: '100%' }}></div>
              </div>
            </div>
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-slate-600">Water Saved</span>
                <span className="text-slate-900">21,420 L</span>
              </div>
              <div className="w-full bg-slate-100 rounded-full h-2">
                <div className="bg-blue-500 h-2 rounded-full" style={{ width: '100%' }}></div>
              </div>
            </div>
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-slate-600">Fossil Fuel Offset</span>
                <span className="text-slate-900">5,712 L</span>
              </div>
              <div className="w-full bg-slate-100 rounded-full h-2">
                <div className="bg-amber-500 h-2 rounded-full" style={{ width: '100%' }}></div>
              </div>
            </div>
          </div>
        </div>

        {/* Sustainability Goals */}
        <div className="bg-gradient-to-br from-green-50 to-white rounded-2xl border border-green-200 p-4">
          <h3 className="text-slate-900 mb-3">Sustainability Goals</h3>
          <div className="space-y-3 text-sm">
            <div className="flex items-start gap-2">
              <div className="w-1.5 h-1.5 rounded-full bg-green-500 mt-1.5"></div>
              <div className="flex-1">
                <div className="flex justify-between mb-1">
                  <span className="text-slate-600">Carbon Neutral Target</span>
                  <span className="text-green-600">78%</span>
                </div>
                <div className="w-full bg-white rounded-full h-2">
                  <div className="bg-green-500 h-2 rounded-full" style={{ width: '78%' }}></div>
                </div>
              </div>
            </div>
            <div className="flex items-start gap-2">
              <div className="w-1.5 h-1.5 rounded-full bg-green-500 mt-1.5"></div>
              <div className="flex-1">
                <div className="flex justify-between mb-1">
                  <span className="text-slate-600">100% Renewable Energy</span>
                  <span className="text-green-600">92%</span>
                </div>
                <div className="w-full bg-white rounded-full h-2">
                  <div className="bg-green-500 h-2 rounded-full" style={{ width: '92%' }}></div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Impact Summary */}
        <div className="bg-slate-50 rounded-xl p-4">
          <h4 className="text-slate-900 mb-3 text-sm">Your Contribution to a Cleaner Planet</h4>
          <p className="text-xs text-slate-600 leading-relaxed">
            Since installing your solar system, you've generated clean, renewable energy equivalent to removing 
            <span className="text-slate-900"> 3.1 cars</span> from the road for a year. Your commitment to sustainable 
            energy is making a real difference in reducing greenhouse gas emissions and combating climate change.
          </p>
        </div>
      </div>
    </div>
  );
}
