import React from 'react';
import { DollarSign, TrendingUp, PiggyBank, Target, Zap, Award, ArrowRight } from 'lucide-react';
import { AreaChart, Area, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from 'recharts';

const savingsData = [
  { month: 'Jul', withAI: 212, withoutAI: 186 },
  { month: 'Aug', withAI: 238, withoutAI: 212 },
  { month: 'Sep', withAI: 224, withoutAI: 198 },
  { month: 'Oct', withAI: 252, withoutAI: 224 },
  { month: 'Nov', withAI: 218, withoutAI: 189 },
  { month: 'Dec', withAI: 204, withoutAI: 176 },
  { month: 'Jan', withAI: 268, withoutAI: 234 },
];

export function SavingsScreen() {
  const totalSavings = 7842;
  const aiExtraSavings = 1186;
  const systemCost = 18500;
  const roiProgress = (totalSavings / systemCost) * 100;
  const standardPayback = 6.8;
  const ohwrPayback = 5.2;

  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-emerald-600 via-emerald-700 to-green-700 text-white p-6 rounded-b-3xl relative overflow-hidden">
        <div className="absolute inset-0 opacity-10">
          <div className="absolute top-0 right-0 w-40 h-40 border border-white rounded-full"></div>
        </div>
        <div className="relative z-10">
          <div className="flex items-center gap-2 mb-2">
            <Award className="w-5 h-5 text-emerald-200" />
            <span className="text-xs text-emerald-200 uppercase tracking-wider">Financial Intelligence</span>
          </div>
          <h1 className="text-2xl mb-1">Savings & ROI</h1>
          <p className="text-emerald-100 text-sm">How intelligence drives your returns</p>
        </div>
      </div>

      <div className="px-4 flex flex-col gap-5">
        {/* Hero: Intelligence Creates Extra Value */}
        <div className="bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl p-5 text-white shadow-lg">
          <div className="flex items-start gap-3 mb-4">
            <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center flex-shrink-0">
              <Zap className="w-5 h-5" />
            </div>
            <div>
              <h3 className="text-lg mb-1">AI-Generated Extra Earnings</h3>
              <p className="text-blue-50 text-sm leading-relaxed">
                Beyond standard solar monitoring, Ohwr's intelligence has generated an additional <span className="text-white">R{aiExtraSavings}</span> through optimization, early issue detection, and predictive adjustments.
              </p>
            </div>
          </div>
          <div className="grid grid-cols-2 gap-3 pt-3 border-t border-white/20">
            <div>
              <div className="text-blue-100 text-xs mb-1">Without AI</div>
              <div className="text-xl">R{totalSavings - aiExtraSavings}</div>
            </div>
            <div>
              <div className="text-blue-100 text-xs mb-1">With Ohwr AI</div>
              <div className="text-xl text-emerald-300">R{totalSavings}</div>
            </div>
          </div>
        </div>

        {/* Today's Performance */}
        <div className="bg-gradient-to-br from-emerald-50 to-white rounded-2xl border border-emerald-200 p-6 shadow-sm">
          <div className="flex items-center gap-2 mb-4">
            <DollarSign className="w-5 h-5 text-emerald-600" />
            <h3 className="text-slate-600">Today's Revenue</h3>
          </div>
          <div className="flex items-baseline gap-2 mb-2">
            <span className="text-5xl text-slate-900">R8.40</span>
          </div>
          <div className="flex items-center gap-1 text-emerald-600 text-sm mb-4">
            <TrendingUp className="w-4 h-4" />
            <span>+12.5% vs yesterday</span>
          </div>
          <div className="pt-4 border-t border-emerald-200 text-sm">
            <div className="flex items-center justify-between">
              <span className="text-slate-600">AI optimization bonus today:</span>
              <span className="text-emerald-600">+R0.68</span>
            </div>
          </div>
        </div>

        {/* Monthly Comparison */}
        <div className="grid grid-cols-2 gap-4">
          <div className="bg-white rounded-2xl border border-slate-200 p-4">
            <div className="text-sm text-slate-600 mb-2">This Month</div>
            <div className="text-2xl text-slate-900 mb-1">R268</div>
            <div className="flex items-center gap-1 text-emerald-600 text-xs">
              <TrendingUp className="w-3 h-3" />
              <span>+19.3%</span>
            </div>
          </div>
          <div className="bg-white rounded-2xl border border-slate-200 p-4">
            <div className="text-sm text-slate-600 mb-2">AI Contribution</div>
            <div className="text-2xl text-emerald-600 mb-1">+R34</div>
            <div className="text-xs text-slate-500">14.5% of total</div>
          </div>
        </div>

        {/* Comparative Savings Chart */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5 shadow-sm">
          <div className="flex items-center justify-between mb-1">
            <h3 className="text-slate-900 mb-1">With vs Without Intelligence</h3>
            <div className="px-2 py-1 bg-emerald-50 text-emerald-700 rounded-lg text-xs">
              +17.9%
            </div>
          </div>
          <p className="text-sm text-slate-500 mb-4">Monthly revenue comparison</p>
          <ResponsiveContainer width="100%" height={220}>
            <AreaChart data={savingsData}>
              <defs>
                <linearGradient id="colorWithAI" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#10B981" stopOpacity={0.3}/>
                  <stop offset="95%" stopColor="#10B981" stopOpacity={0}/>
                </linearGradient>
                <linearGradient id="colorWithoutAI" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#94A3B8" stopOpacity={0.2}/>
                  <stop offset="95%" stopColor="#94A3B8" stopOpacity={0}/>
                </linearGradient>
              </defs>
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
                label={{ value: '$', angle: -90, position: 'insideLeft', style: { fontSize: 12, fill: '#64748B' } }}
              />
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: '#1E293B', 
                  border: 'none', 
                  borderRadius: '8px',
                  color: '#fff'
                }}
                formatter={(value: number) => [`$${value}`, '']}
              />
              <Area 
                type="monotone" 
                dataKey="withoutAI" 
                stroke="#94A3B8" 
                strokeWidth={2}
                fill="url(#colorWithoutAI)"
                name="Standard Monitoring"
              />
              <Area 
                type="monotone" 
                dataKey="withAI" 
                stroke="#10B981" 
                strokeWidth={3}
                fill="url(#colorWithAI)"
                name="With Ohwr Intelligence"
              />
            </AreaChart>
          </ResponsiveContainer>
          <div className="flex items-center gap-4 mt-3 text-xs">
            <div className="flex items-center gap-2">
              <div className="w-3 h-0.5 bg-emerald-500"></div>
              <span className="text-slate-600">With Ohwr AI</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-0.5 bg-slate-400"></div>
              <span className="text-slate-600">Standard Monitoring</span>
            </div>
          </div>
        </div>

        {/* Cumulative Savings Impact */}
        <div className="bg-gradient-to-br from-blue-50 to-white rounded-2xl border border-blue-200 p-6">
          <div className="flex items-center gap-2 mb-4">
            <PiggyBank className="w-6 h-6 text-blue-600" />
            <h3 className="text-slate-900">Total Savings Since Install</h3>
          </div>
          <div className="flex items-baseline gap-2 mb-1">
            <span className="text-4xl text-slate-900">R{totalSavings.toLocaleString()}</span>
          </div>
          <div className="text-sm text-emerald-600 mb-4">
            Includes R{aiExtraSavings} from AI optimization
          </div>
          <div className="grid grid-cols-2 gap-4 text-sm pt-4 border-t border-blue-200">
            <div>
              <div className="text-slate-600 mb-1">Installation Date</div>
              <div className="text-slate-900">Mar 15, 2023</div>
            </div>
            <div>
              <div className="text-slate-600 mb-1">Tracking Period</div>
              <div className="text-slate-900">34 months</div>
            </div>
            <div>
              <div className="text-slate-600 mb-1">Avg Monthly</div>
              <div className="text-slate-900">R231</div>
            </div>
            <div>
              <div className="text-slate-600 mb-1">AI Boost/Month</div>
              <div className="text-emerald-600">+R35</div>
            </div>
          </div>
        </div>

        {/* ROI Acceleration Story */}
        <div className="bg-white rounded-2xl border border-slate-200 p-6">
          <div className="flex items-center gap-2 mb-4">
            <Target className="w-6 h-6 text-slate-700" />
            <h3 className="text-slate-900">Accelerated ROI Timeline</h3>
          </div>
          
          {/* Visual Comparison */}
          <div className="space-y-4 mb-6">
            <div>
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm text-slate-600">Standard Monitoring</span>
                <span className="text-slate-900">{standardPayback} years</span>
              </div>
              <div className="relative">
                <div className="w-full bg-slate-100 rounded-full h-3">
                  <div className="bg-slate-400 h-3 rounded-full" style={{ width: '100%' }}></div>
                </div>
                <span className="absolute right-2 top-0 bottom-0 flex items-center text-white text-xs">
                  {standardPayback}y
                </span>
              </div>
            </div>

            <div>
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-2">
                  <span className="text-sm text-slate-900">With Ohwr Intelligence</span>
                  <div className="px-2 py-0.5 bg-emerald-100 text-emerald-700 rounded text-xs">
                    -24% faster
                  </div>
                </div>
                <span className="text-emerald-600">{ohwrPayback} years</span>
              </div>
              <div className="relative">
                <div className="w-full bg-slate-100 rounded-full h-3">
                  <div className="bg-gradient-to-r from-emerald-500 to-emerald-600 h-3 rounded-full" style={{ width: `${(ohwrPayback / standardPayback) * 100}%` }}></div>
                </div>
                <span className="absolute right-2 top-0 bottom-0 flex items-center text-white text-xs">
                  {ohwrPayback}y
                </span>
              </div>
            </div>
          </div>

          {/* Current Progress */}
          <div className="pt-4 border-t border-slate-200">
            <div className="flex justify-between items-center mb-2 text-sm">
              <span className="text-slate-600">Investment Recovery</span>
              <span className="text-slate-900">{roiProgress.toFixed(1)}%</span>
            </div>
            <div className="w-full bg-slate-100 rounded-full h-3 mb-2">
              <div 
                className="bg-gradient-to-r from-emerald-500 to-emerald-600 h-3 rounded-full transition-all duration-1000"
                style={{ width: `${Math.min(roiProgress, 100)}%` }}
              ></div>
            </div>
            <div className="flex justify-between text-xs text-slate-500">
              <span>R{totalSavings.toLocaleString()} recovered</span>
              <span>R{(systemCost - totalSavings).toLocaleString()} remaining</span>
            </div>
          </div>

          <div className="mt-4 pt-4 border-t border-slate-200 flex items-center justify-between">
            <span className="text-sm text-slate-600">Time saved with AI:</span>
            <span className="text-xl text-emerald-600">-1.6 years</span>
          </div>
        </div>

        {/* Intelligence Breakdown */}
        <div className="bg-gradient-to-br from-emerald-50 to-white rounded-2xl border border-emerald-200 p-5">
          <h3 className="text-slate-900 mb-4">Where Intelligence Creates Value</h3>
          <div className="space-y-3">
            <div className="flex items-center justify-between p-3 bg-white rounded-xl">
              <div className="flex items-center gap-3">
                <div className="w-2 h-2 rounded-full bg-emerald-500"></div>
                <span className="text-sm text-slate-900">Performance Optimization</span>
              </div>
              <span className="text-emerald-600">+R486</span>
            </div>
            <div className="flex items-center justify-between p-3 bg-white rounded-xl">
              <div className="flex items-center gap-3">
                <div className="w-2 h-2 rounded-full bg-blue-500"></div>
                <span className="text-sm text-slate-900">Early Issue Detection</span>
              </div>
              <span className="text-blue-600">+R420</span>
            </div>
            <div className="flex items-center justify-between p-3 bg-white rounded-xl">
              <div className="flex items-center gap-3">
                <div className="w-2 h-2 rounded-full bg-purple-500"></div>
                <span className="text-sm text-slate-900">Predictive Maintenance</span>
              </div>
              <span className="text-purple-600">+R280</span>
            </div>
          </div>
        </div>

        {/* Future Projections */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5">
          <h3 className="text-slate-900 mb-4">25-Year Financial Projection</h3>
          <div className="space-y-3 text-sm">
            <div className="flex items-start gap-2">
              <ArrowRight className="w-4 h-4 text-emerald-500 mt-0.5 flex-shrink-0" />
              <div className="flex-1">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-slate-600">Total Lifetime Savings</span>
                  <span className="text-slate-900">R87,400</span>
                </div>
                <p className="text-xs text-slate-500">With projected 3.2% annual rate increases</p>
              </div>
            </div>
            <div className="flex items-start gap-2">
              <ArrowRight className="w-4 h-4 text-emerald-500 mt-0.5 flex-shrink-0" />
              <div className="flex-1">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-slate-600">AI Intelligence Bonus</span>
                  <span className="text-emerald-600">+R14,200</span>
                </div>
                <p className="text-xs text-slate-500">Extra earnings vs standard monitoring</p>
              </div>
            </div>
            <div className="flex items-start gap-2">
              <ArrowRight className="w-4 h-4 text-blue-500 mt-0.5 flex-shrink-0" />
              <div className="flex-1">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-slate-600">Avoided Repair Costs</span>
                  <span className="text-blue-600">R8,400</span>
                </div>
                <p className="text-xs text-slate-500">Through predictive maintenance</p>
              </div>
            </div>
          </div>
        </div>

        {/* Investment Summary */}
        <div className="bg-gradient-to-br from-slate-900 to-blue-900 rounded-2xl p-5 text-white">
          <div className="flex items-center gap-2 mb-3">
            <Award className="w-5 h-5 text-emerald-400" />
            <span className="text-emerald-400 text-sm uppercase tracking-wider">Total Value Created</span>
          </div>
          <div className="flex items-baseline gap-2 mb-2">
            <span className="text-4xl">R109,800</span>
          </div>
          <p className="text-slate-100 text-sm mb-4">
            Projected 25-year value: <span className="text-white">R87,400 savings</span> + <span className="text-emerald-400">R14,200 AI bonus</span> + <span className="text-blue-400">R8,400 repair prevention</span> = <span className="text-white">494% ROI</span>
          </p>
          <div className="pt-3 border-t border-white/20 text-sm">
            <div className="flex items-center justify-between">
              <span className="text-slate-300">Payback completion:</span>
              <span className="text-lg">April 2028</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}